require 'faraday'
require 'json'

class Scheduler
  API_URL = 'https://shows-remote-api.com'

  def initialize
    @connection = Faraday.new(url: API_URL)
    @shows = Show.all
  end

  def fetch_remote_data
    response = @connection.get
    JSON.parse(response.body)
  rescue Faraday::ConnectionFailed
    []
  end

  def shows_needing_update
    current_time = Time.now.to_i
    @shows.select do |show|
      show.quantity != remote_quantity(show.id) ||
        show.last_update.nil? ||
        show.last_update < current_time - 3600
    end
  end

  def schedule_updates
    remote_data = fetch_remote_data
    update_schedule = {}

    shows_needing_update.each_with_index do |show, index|
      update_schedule[show.id] = index * 15
    end

    update_schedule
  end

  private

  def remote_quantity(show_id)
    remote_show = remote_data.find { |show| show["id"] == show_id }
    remote_show ? remote_show["quantity"] : nil
  end
end

class DashboardController < ApplicationController
  def index
    @device_scans = Device.all(user_id: current_user['id'])
  end
end
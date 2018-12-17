class Admin::AdminbaseController < ApplicationController
  before_action :authenticate_user!
end


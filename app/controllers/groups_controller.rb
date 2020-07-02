class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
  end

  def create
  end

  def destroy
  end
end

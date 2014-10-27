class PagesController < ApplicationController
  def home
    @note = Note.new
  end
end

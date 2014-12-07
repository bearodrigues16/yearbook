class AvatarController < ApplicationController
  def serve
  	@user = User.find(params[:id])
  	send_data(@user.avatar, :filename => "#{@user.id}_avatar.jpg", :disposition => "inline")
  end
end

class MemesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @memes = Meme.all
    end

    def new
        @meme = Meme.new
    end

    def create
        current_user.memes.create(meme_params)
        redirect_to root_path
    end

    private

    def meme_params
        params.require(:meme).permit(:top_text, :bottom_text)
    end

end

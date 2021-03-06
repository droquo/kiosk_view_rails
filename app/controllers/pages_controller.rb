class PagesController < ApplicationController

	#http_basic_authenticate_with name: "admin", password: "yourpass", only: [:create, :destroy]

	def create
		@book = Book.find(params[:book_id])
		@page = @book.pages.create(page_params)
		redirect_to book_path(@book)
	end

	def destroy
		@book = Book.find(params[:book_id])
		@page = @book.pages.find(params[:id])

		@page.destroy

		redirect_to book_path(@book)
	end

	private
		def page_params
			params.require(:page).permit(:file, :page_num, :comment, :image_path)
		end
	


end

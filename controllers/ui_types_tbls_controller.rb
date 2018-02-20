class UiTypesTblsController < ApplicationController

	def index
		@ui_types = UI_TYPES_TBL.all
	end

	def new
		@ui_types = UI_TYPES_TBL.new
	end

	def show
		@ui_types = UI_TYPES_TBL.find_by(params[:UI_TYPE_ID])
	end

	def edit
		@ui_types = UI_TYPES_TBL.find_by(params[:UI_TYPE_ID])
	end

	def create
		@ui_types = UI_TYPES_TBL.new(ui_type_params)
		if @ui_types.save
			redirect_to @ui_types
		else
			render 'new'
		end
	end

	def update
		@ui_types = UI_TYPES_TBL.find_by(params[:UI_TYPE_ID])
		if @ui_types.update_attributes(ui_type_params)
			redirect_to root_url
		else
			render 'edit'
		end
	end

	def destroy
		UI_TYPES_TBL.find_by(params[:UI_TYPE_ID]).destroy
		redirect_to root_url
	end

	private

		def ui_type_params
			params.require(:ui_types_tbl).permit(:UI_TYPE_ID, :UI_TYPE)
		end
end


class SubsystemTblsController < ApplicationController
	
	def index
		@subs = SUBSYSTEM_TBL.all
	end

	def new
		@subs = SUBSYSTEM_TBL.new
	end

	def show
		@subs = SUBSYSTEM_TBL.find_by(params[:SUBSYSTEM_ID])
	end

	def edit
		@subs = SUBSYSTEM_TBL.find_by(params[:SUBSYSTEM_ID])
	end

	def create
		@subs = SUBSYSTEM_TBL.new(sub_params)
		if @subs.save
			redirect_to @subs
		else
			render 'new'
		end
	end

	def update
		@subs = SUBSYSTEM_TBL.find_by(params[:SUBSYSTEM_ID])
		if @subs.update_attributes(sub_params)
			redirect_to root_url
		else
			render 'edit'
		end
	end

	def destroy
		SUBSYSTEM_TBL.find_by(params[:SUBSYSTEM_ID]).destroy
		redirect_to root_url
	end

	private

		def sub_params
			params.require(:subsystem_tbl).permit(:SUBSYSTEM_ID, :SUBSYSTEM_NAME)
		end
end

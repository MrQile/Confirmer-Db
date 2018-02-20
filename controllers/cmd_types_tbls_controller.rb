class CmdTypesTblsController < ApplicationController
	
	def index
		@cmd_types = CMD_TYPES_TBL.all
	end

	def new
		@cmd_types = CMD_TYPES_TBL.new
	end

	def show
		@cmd_types = CMD_TYPES_TBL.find_by(params[:CMD_TYPE_ID])
	end

	def edit
		@cmd_types = CMD_TYPES_TBL.find_by(params[:CMD_TYPE_ID])
	end

	def create
		@cmd_types = CMD_TYPES_TBL.new(cmd_type_params)
		if @cmd_types.save
			redirect_to @cmd_types
		else
			render 'new'
		end
	end

	def update
		@cmd_types = CMD_TYPES_TBL.find_by(params[:CMD_TYPE_ID])
		if @cmd_types.update_attributes(cmd_type_params)
			redirect_to root_url
		else
			render 'edit'
		end
	end

	def destroy
		CMD_TYPES_TBL.find_by(params[:CMD_TYPE_ID]).destroy
		redirect_to root_url
	end

	private

		def cmd_type_params
			params.require(:cmd_types_tbl).permit(:CMD_TYPE_ID, :CMD_TYPE, :CMD_TYPES_TBL_CMD_TYPE)
		end
end

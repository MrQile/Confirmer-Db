class BaseTablesController < ApplicationController
# before_action :DecoderArray, only: [:index]
    def index
        @base = BaseTable.all
    end

    def new
        @base = BaseTable.new
    end

    def create
        @base = BaseTable.new(base_params)
        if @base.save
            redirect_to root_url
        else
            render 'new'
        end
    end

    private

        def base_params
            params.require(:base_table).permit(:name, :conF_string => [])
        end
end

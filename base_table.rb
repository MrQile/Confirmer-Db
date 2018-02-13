class BaseTable < ApplicationRecord
    before_save :ConverterArray
    serialize :conF_string
    attr_accessor :valv

    #  def self.Conf_count  # self. is used when u have to call the method on te whole class example User.Conf_count
    #      Confirmer.count
    #  end

    def ConverterArray  # self. is not used when u have to call the method on the instance variable for example user = User.new, user.ConverterArray
        count = Confirmer.count
        index = Array.new(count, 0)
        conf = conF_string.map(&:to_i)
        conf.each do |n|
            index[n] = 1
        end
        index = index*""
        self.conF_string = index
    end

    def DecoderArray
        count = Confirmer.count
        value = []
        conf = conF_string.split("")
        i = 0
        conf.each_with_index do |n,index|
            if n=="1"
                value[i] = index
                i+=1
            end
        end
        @valv = Confirmer.where(:position => value).pluck(:name)
    end
end

class DatepickerInput < SimpleForm::Inputs::Base
	def input(wrapper_options)
		@builder.text_field(attribute_name, input_html_options.merge(datepicker_options()))
	end	

	def datepicker_options()
		datepicker_options = {
    	}
	end
  
end
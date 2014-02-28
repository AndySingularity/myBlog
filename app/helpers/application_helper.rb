module ApplicationHelper
	def title(value) # Метод отвечающий за заголовки страниц
    unless value.nil?
      @title = "#{value} | BlogSystem"
    end
  end
end

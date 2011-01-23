# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def pagina_actual(menu, actual)
    logger.info('patata - actual es: ' + actual.to_s)
    if (actual == menu)
      return true
    else
      return false
    end
  end

end

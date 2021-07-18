class ApplicationController < ActionController::API
  rescue_from NoMethodError, with: :render_not_found

  # gera um link para um gráfico na API graphviz
  def gen_link(dot)
    "https://quickchart.io/graphviz?graph=digraph{#{dot}}"
  end

  private

  def render_not_found
    render json: { message: 'Não encontrado :(' }, status: 404
  end
end

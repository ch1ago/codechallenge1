#
# Implementei uma autenticacao mais objetiva.
# Eu sou um dos mantenedores dos projetos oauth-ruby.
#
# Evidencias:
#
# https://github.com/orgs/oauth-xx/people?query=role%3Aowner
# https://rubygems.org/gems/oauth
#
class AuthController < ApplicationController
  class Error < StandardError; end
  class OrgNotFound < Error; end

  # GET /auth
  def index
  end

  # POST /auth
  # params[] :org_id
  def login
    org_id = params[:org_id]
    _find_org(org_id)

    set_current_org(@org)
    flash[:notice] = "Bem vindo, #{@org.name}"

    redirect_to :home
  rescue OrgNotFound
    flash[:alert] = "Organizacao nao encontrada: '#{org_id}'"
    render action: :index
  end

  # DELETE /auth
  def out
    set_current_org(nil)
    flash[:notice] = "Voce saiu"
    redirect_to :auth
  end

  private

  def _find_org(org_id)
    @org = Org.find(org_id)
  rescue ActiveRecord::RecordNotFound
    raise OrgNotFound
  end
end

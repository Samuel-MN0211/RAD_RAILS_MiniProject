class Ability
  include CanCan::Ability

  def initialize(user)

    alias_action :destroy, to: :cancelar


    can :read, Oferta, status: :aprovada


    return unless user.present?


    if user.aluno?
      can :read, Oferta, status: :aprovada
      can :create, Candidatura, oferta: { status: :aprovada }
    end


    if user.empresa?

      can :manage, Oferta, user_id: user.id


      can :create, Estagio, oferta: { user_id: user.id, status: :aprovada }
    end


    if user.coordenador?
      can :manage, :all
    end
  end
end
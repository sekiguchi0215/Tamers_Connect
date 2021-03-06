class TeamsController < ApplicationController
  def new
    @team = Team.new
    @user = User.where.not(id: current_user.id).order(:created_at)
  end

  def create
    @team = Team.new
    @team.users << current_user
    if @team.save
      @team.team_invitation_notification(current_user, team_params[:user_ids], @team.id)
      redirect_to team_path(@team), notice: "チームを作成し、招待を送りました。"
    else
      render :new
    end
  end

  def index
    @teams = current_user.teams.order(:created_at)
  end

  def show
    @team = Team.find(params[:id])
    if Member.where(user_id: current_user.id, team_id: @team.id).present?
      # 招待機能の記述
      member_ids = @team.users.pluck(:user_id)
      visited_ids = @team.notifications.where(action: "invitation").pluck(:visited_id)
      @other_users = User.where.not(id: member_ids).where.not(id: visited_ids).order(:created_at)
      # チームメッセージの記述
      @members = @team.users.order(:created_at)
      @team_message = TeamMessage.new
      @messages = @team.team_messages.where.not(is_valid: false)
    else
      redirect_to root_path, alert: "このチームに所属していません。"
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to team_path(@team), notice: "グループを編集しました。"
    else
      render :edit
    end
  end

  def invitation
    @team = Team.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    notification = Notification.where(visited_id: @user.id, team_id: @team.id, action: "invitation")
    unless notification.exists?
      @team.save_team_invitation_notification(current_user, @user.id, @team.id)
      redirect_to request.referer, notice: "招待を送りました。"
    else
      redirect_to request.referer, alert: "すでに招待しています。"
    end
  end

  def join
    @team = Team.find(params[:id])
    unless @team.users.include?(current_user)
      @team.users << current_user
      notification = Notification.find_by(visited_id: current_user.id, team_id: @team.id, action: "invitation")
      notification.destroy
    end
    redirect_to team_path(@team), notice: "チームに参加しました。"
  end

  def leave
    team = Team.find(params[:id])
    Member.delete_by(user_id: current_user.id, team_id: team.id)
    redirect_to root_path, alert: "チームから脱退しました。"
  end

  private

  def team_params
    params.require(:team).permit(:name, :user_id, user_ids: [])
  end
end

class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @search = Member.ransack(params[:q])
    @members = @search.result.includes(:prayers, :speakers)
    @members.order(:name)
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
    @member = @member ||= Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  helper_method :prayable, :speakable

  def prayable
    @members = Member.where(current: true)
    @adults = @members.find_all { |p| p.birth_date < (Date.today - 7500) }
    parts = @adults.partition { |o| o.prayers.blank? }
    @prayable = parts.last.sort_by { |p| p.prayers.pluck(:date) } + parts.first.sort_by { |p| p.prayers.pluck(:member_id) }
    return @prayable
  end

  def speakable
    @members = Member.where(current: true)
    @adults = @members.find_all { |p| p.birth_date < (Date.today - 4400) }
    parts = @adults.partition { |o| o.speakers.blank? }
    @speakable = parts.last.sort_by { |p| p.speakers.pluck(:date) } + parts.first.sort_by { |p| p.speakers.pluck(:member_id) }
    return @speakable
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :gender, :birth_date, :phone_number, :email, :current)
    end
end

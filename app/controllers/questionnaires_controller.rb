class QuestionnairesController < ApplicationController
  # GET /questionnaires
  # GET /questionnaires.json
  def index
#    @questionnaires = Questionnaire.all
#    @questionnaires = current_user.questionnaires
    if params[:mode] == 'administer'
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @questionnaires }
      end
    else
      respond_to do |format|
        format.html { render 'respond.index' }
        format.json { render :json => @questionnaires }
      end
    end
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @questionnaire }
    end
  end

  # GET /questionnaires/new
  # GET /questionnaires/new.json
  def new
    @questionnaire = Questionnaire.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @questionnaire }
    end
  end

  # GET /questionnaires/1/edit
  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(params[:questionnaire])
    @group = Group.new(params[:group])
    @group.group_type = "administrator"
    @group.questionnaires << @questionnaire
    @group.users << current_user

    respond_to do |format|
      if @questionnaire.save and @group.save
        format.html { redirect_to questionnaires_path, :notice => 'Questionnaire and group were successfully created.' }
        format.json { render :json => @questionnaire, :status => :created, :location => @questionnaire }
      else
        format.html { render :action => "new" }
        format.json { render :json => @questionnaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /questionnaires/1
  # PUT /questionnaires/1.json
  def update
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      if @questionnaire.update_attributes(params[:questionnaire]) and @questionnaire.administrator.update_attributes(params[:group])
        format.html { redirect_to @questionnaire, :notice => 'Questionnaire was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @questionnaire.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to questionnaires_url }
      format.json { head :no_content }
    end
  end
end

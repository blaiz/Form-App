class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @groups = @questionnaire.respondents

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @group = Group.new(params[:group])
    @group.group_type = 'respondent'
    @group.questionnaires << @questionnaire
    puts YAML::dump(@group.questionnaires)

    respond_to do |format|
      if @group.save and @questionnaire.save
        format.html { redirect_to questionnaire_groups_path(@questionnaire), :notice => 'Group was successfully created.' }
        format.json { render :json => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, :notice => 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
end

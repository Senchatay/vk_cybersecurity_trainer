class SolutionsController < ApplicationController
  before_action :find_task
  before_action :set_solution, only: %i[show edit update destroy]
  before_action :check_permissions, only: %i[show edit]

  attr_accessor :task, :solution

  # GET /solutions or /solutions.json
  def index
    @solutions = Solution.where(user: current_user, task: task)
  end

  skip_before_action :find_task, only: :own
  def own
    @solutions = Solution.where(user: current_user)
  end

  # GET /solutions/1 or /solutions/1.json
  def show; end

  # GET /solutions/new
  def new
    @solution = Solution.new
  end

  # GET /solutions/1/edit
  def edit; end

  # POST /solutions or /solutions.json
  def create
    @solution = Solution.new(solution_params)
    solution.user = current_user
    respond_to do |format|
      if solution.save
        check_if_right
        format.html { redirect_to task_solution_path(task, solution), notice: 'Решение было успешно добавлено.' }
        format.json { render :show, status: :created, location: solution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solutions/1 or /solutions/1.json
  def update
    respond_to do |format|
      if solution.update(solution_params)
        check_if_right
        format.html { redirect_to task_solution_path(task, solution), notice: 'Решение было успешно отредактировано.' }
        format.json { render :show, status: :ok, location: solution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1 or /solutions/1.json
  def destroy
    solution.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Решение удалено.' }
      format.json { head :no_content }
    end
  end

  private

  def find_task
    @task = Task.find(task_id)
  end

  def task_id
    params.require(:task_id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_solution
    @solution = Solution.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def solution_params
    params.require(:solution).permit(:content, :task_id)
  end

  def check_if_right
    return unless task.auto?
    return solution.set_right! if params[:solution][:content] == task.right_solution

    solution.set_wrong!
  end

  def check_permissions
    return if solution.user == current_user || task.user == current_user

    respond_to do |format|
      format.html { redirect_back_or_to root_path, notice: 'Нет доступа к решению.' }
      format.json { head :no_content }
    end
  end
end

module ProjectsHelper
  def created_by_at(user, obj)
   "Added by: #{user.name} - #{obj.created_at.strftime("%l:%M %p on %A, %B %e")}"
  end
end

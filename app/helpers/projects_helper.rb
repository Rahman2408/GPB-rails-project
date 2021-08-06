module ProjectsHelper
  def added_by_at(user, obj)
   "Added by: #{user.name} - #{obj.created_at.strftime("%l:%M %p on %A, %B %e")}"
  end

  def created_by_at(user, obj)
    "Created by: #{user.name} - #{obj.created_at.strftime("%l:%M %p on %A, %B %e")}"
  end
end

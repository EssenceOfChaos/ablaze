module ApplicationHelper
# # FIXME unable to click 'profile' in the navbar - weird error traces to active_class
def active_class(controller_name, action_name)    
#     "active" if current_page?(controller: controller_name, action: action_name)
  end
   def active_span(controller_name, action_name)
#    # "(current)" if current_page?(controller: controller_name, action: action_name)
  end

end

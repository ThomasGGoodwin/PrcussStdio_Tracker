module RsvpsHelper
    def get_user_name(user_id)
        content = ""
        @user = User.where(email: user_id)
        if @user.length == 1
            content << @user.first.last_name + ", " + @user.first.first_name
        else
            content << user_id
        end
        content.html_safe
    end
end

class UsersController < ApplicationController
    def new
        # render login page
    end

    def show
        # handled by memoization below
    end

    def destroy
        # Log User out
        # set session[:user_id] to null
        # redirect to login page
    end

    def main
        @main = session[:main]
        p @main, "references"
        render "/users/main"
    end
    


    def create
        return render text: "fucking finally!" if new_user.valid?
        
        p new_user.errors

        redirect_to :back, alert: new_user.errors.full_messages
    end

private
    # memoization
    helper_method def user
        @user ||=User.find_by(params[:id])
    end
    
    helper_method def new_user
        @new_user ||=User.create(user_params)
    end
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end 

end
    # def create
        # Log User In
        # if authenticate true
            # save user id to session
            # redirect to users profile page
        # if authenticate false
            # add an error message -> flash[:errors] = ["Invalid"]
            # redirect to login page

        # Create a user
        # @user = User.create(user_params)
        #     # if user is valid
        # if @user.valid?
        #     # redirect to success page
        #     redirect_to "/main"
        # else
        #     # render full flash error messages
        #     flash[:errors] = @user.errors.full_messages
        #     flash[:main] = params
        #     # redirect back to the register
        #     redirect_to "/"
        # end
    # end

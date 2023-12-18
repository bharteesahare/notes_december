It seems like you're encountering a rollback error when trying to update user attributes that include the `password` and `password_confirmation` fields. In Active Admin, when you're dealing with password-related attributes, you might need to handle password updates and validations a bit differently due to security considerations.

Here's how you can approach this:

1. **Skip Password Fields for Existing Users:**
   When editing an existing user's attributes, you generally want to skip updating the password fields unless a new password is provided. This prevents unintentional password changes. You can achieve this by adding a condition to the user inputs in your Active Admin form:

   ```ruby
   ActiveAdmin.register Organization do
     permit_params :name, users_attributes: [:id, :email, :password, :password_confirmation, :_destroy]

     form do |f|
       f.inputs "Organization Details" do
         f.input :name
       end
       f.inputs "Users" do
         f.has_many :users, allow_destroy: true do |u|
           u.input :email
           u.input :password, required: false, input_html: { autocomplete: 'new-password' }
           u.input :password_confirmation, required: false, input_html: { autocomplete: 'new-password' }
         end
       end
       f.actions
     end
   end
   ```

   In this example, the `required: false` option prevents the password fields from being required during updates. Also, the `autocomplete: 'new-password'` attribute helps modern browsers handle password autofill correctly.

2. **Password Validation:**
   You'll need to update your user model to handle password validations correctly. Typically, when updating a user's password, you want to validate its presence only if a new password is being set. This can be achieved by using a conditional validation:

   ```ruby
   class User < ApplicationRecord
     validates :password, presence: true, length: { minimum: 8 }, if: :password_required?

     def password_required?
       new_record? || password.present?
     end
   end
   ```

   This ensures that the password is only validated when it's either a new record or a new password has been provided.

Remember to adapt these examples to your specific situation, and make sure you're following best practices for handling user passwords securely. Always keep security in mind when dealing with password-related attributes.


ActiveAdmin.register Organization do
  permit_params :name, users_attributes: [:id, :email, :password, :password_confirmation, :_destroy]

  form do |f|
    f.inputs "Organization Details" do
      f.input :name
    end
    f.inputs "Users" do
      f.has_many :users, allow_destroy: true do |u|
        u.input :email
        u.input :password, required: true, input_html: { autocomplete: 'new-password' }, hint: "Leave blank to keep the current password."
        u.input :password_confirmation, required: true, input_html: { autocomplete: 'new-password' }
      end
    end
    f.actions
  end
end


  form do |f|
    f.semantic_errors *f.object.errors.full_messages
    f.inputs do
      f.input :name, label: "Organization Name"
      f.input :domain
      f.input :status, as: :select, collection: ['Active', 'Inactive']

      f.inputs "User Info", for: [:user, f.object.user || User.new] do |meta_form|
        meta_form.input :name
        meta_form.input :email
        meta_form.input :password if f.object.new_record?
      end
    end
    
    f.actions
  end
app_password: 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

Link bharti.shahare@truequations.com by Bharti Shahare
Wednesday 16:20
Bharti Shahare

bharti.shahare@truequations.com

Message by Bharti Shahare, has an attachment.


Deploy the code in production:
1. create the pr for the which want to merge.
2. mereg the pr.
3. git checkout master(azuracast)
4. git pull origin azuracast
5. cap production deploy

Cherry Pick:

33a25acea5b70cd3d50e4fd172bc646fd7c4cefe
git cherry-pick 33a25ac

b7e720661d084ea018541cfc6289bed871082fa4
git cherry-pick b7e7206

35ea57b489771b5d03fb6210dda1b771311dbac7
git cherry-pick 35ea57b

[rails]Active Admin, xml, jsonのダウンロードリンクを非表示にする

Install the link
ffmpeg -i "copy_the_url" -codec copy Bhartee_tsrtc_DOWNLOADFILE.mp4
]


git diff app/views/layouts/_playlist.html.erb
diff --git a/app/views/layouts/_playlist.html.erb b/app/views/layouts/_playlist.html.erb
table th, table td
+    #tblLocations .playlist_heading, #tblLocations .playlist_data
     {
         width: 100px;
         padding: 5px;
@@ -40,17 +40,17 @@ var data = {
     }
 </style>
     <tr>
-        <th>ID </th>
-        <th>Priority In Queue</th>
-        <th>Sequence</th>
-        <th>Asset</th>
+        <th class="playlist_heading">ID </th>
+        <th class="playlist_heading">Priority In Queue</th>
+        <th class="playlist_heading">Sequence</th>
+        <th class="playlist_heading">Asset</th>
     </tr>
     <% resource.audio_plays.each_with_index do |a,b| %>
     <tr class="data-row">
-        <td id="ap-id-<%=resource.id%>-<%=a.id%>"><%= a.id %> </td>
-        <td><%= a.priority_in_queue%></td>
-        <td id="ap-seq-<%=a.id%>-<%=b%>" "data-id"="<%=b%>"><%=b%></td>
-        <td><%= if(a.asset.blob.content_type =~/image\/*/)
+        <td class="playlist_data" id="ap-id-<%=resource.id%>-<%=a.id%>"><%= a.id %> </td>
+        <td class="playlist_data"><%= a.priority_in_queue%></td>
+        <td class="playlist_data" id="ap-seq-<%=a.id%>-<%=b%>" "data-id"="<%=b%>"><%=b%></td>
+        <td class="playlist_data"><%= if(a.asset.blob.content_type =~/image\/*/)
             "<img src=#{a.asset_url} width='220' height='130'>".html_safe
           elsif(a.asset.blob.content_type =~/audio\/*/)
             "<audio controls>



 git diff app/views/organization/devices/edit.html.erb
 diff --git a/app/views/organization/devices/edit.html.erb b/app/views/organization/devices/edit.html.erb
 index 6744a92..46be7f8 100644
 --- a/app/views/organization/devices/edit.html.erb
 +++ b/app/views/organization/devices/edit.html.erb
 @@ -23,7 +23,7 @@
                  <div class="mb-3">
                  <label for="device_group" class="form-label"> Device Group </label>
                  <select class="select2 select-Playlist" name="device[device_group_id]">
 -                <option value="<%= @device.device_group.id %>" selected><%= @device.device_group.name %></option>
 +                <option value="<%= @device&.device_group&.id %>" selected><%= @device&.device_group&.name %></option>
                    <% @device_group.each do |pl| %>
                      <option value="<%=pl.id%>"><%= pl.name %></option>
                    <% end %>

git diff app/controllers/organization/devices_controller.rb
diff --git a/app/controllers/organization/devices_controller.rb b/app/controllers/organization/devices_controller.rb
index 6f857af..81e0610 100644
--- a/app/controllers/organization/devices_controller.rb
+++ b/app/controllers/organization/devices_controller.rb
@@ -8,7 +8,7 @@ class Organization::DevicesController < OrganizationController
         q << "mac_address ilike '%#{params[:mac_address]}%'" if params[:mac_address].present?
         q << "play_list_id = #{params[:play_list_id]}" if params[:play_list_id].present?
         q << "device_group_id = #{params[:device_group_id]}" if params[:device_group_id].present?
-
+
         @row_count = current_user.organization.devices.where("#{q.join(' AND ')}").count
         @playlists = current_user.organization.play_lists
         @groups = current_user.organization.device_groups
@@ -94,7 +94,7 @@ class Organization::DevicesController < OrganizationController
         @device
         @user_playlist = PlayList.find_by(:id=>@device.play_list_id)
         @playlists = current_user.organization.play_lists.where.not(:id=>@device.play_list_id)
-        @device_group = current_user.organization.device_groups.where.not(name: @device.device_group.name)
+        @device_group = current_user.organization.device_groups.where.not(name: @device&.device_group&.name)
     end
     def update
         if @device.update(device_params)


 git diff config/routes.rb
diff --git a/config/routes.rb b/config/routes.rb
index 40ed4d2..7063b46 100644
--- a/config/routes.rb
+++ b/config/routes.rb
@@ -77,6 +77,7 @@ Rails.application.routes.draw do
   devise_for :admin_users, ActiveAdmin::Devise.config
   ActiveAdmin.routes(self)

+
   mount ActionCable.server => "/cable"

   get '/health_check', to: proc { [200, {}, ['success']] }
@@ -138,4 +139,12 @@ Rails.application.routes.draw do
       resources :listeners, only: [:create]
     end
   end
+
+  namespace :admin do
+    resources :users do
+      member do
+        get :download_xml
+      end
+    end
+  end
 end



 git diff app/admin/users.rb
diff --git a/app/admin/users.rb b/app/admin/users.rb
index 03e5610..e3a218d 100644
--- a/app/admin/users.rb
+++ b/app/admin/users.rb
@@ -14,6 +14,70 @@ ActiveAdmin.register User do
   #   permitted << :other if params[:action] == 'create' && current_user.admin?
   #   permitted
   # end
+
+  # member_action :download_xml, method: :get do
+  #   @user = User.find(params[:id])
+  #   xml_data = generate_xml_data_for_user(@user) # Replace this with your XML generation logic
+
+  #   send_data xml_data, filename: "user_#{params[:id]}.xml", type: "application/xml"
+  # end
+
+  # action_item :download_xml, only: :show do
+  #   link_to 'Download XML', download_xml_admin_user_path(user)
+  # end
+  # xml_format do
+  #   builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
+  #     xml.users do
+  #       User.all.each do |user|
+  #         xml.user do
+  #           xml.id user.id
+  #           xml.name user.name
+  #           xml.email user.email
+  #           # Add more attributes as needed
+  #         end
+  #       end
+  #     end
+  #   end
+  #   builder.to_xml
+  # end
+
+  # xml_format do
+  #   # Your XML generation logic here
+  #   Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
+  #     xml.users do
+  #       User.all.each do |user|
+  #         xml.user do
+  #           xml.id user.id
+  #           xml.name user.name
+  #           xml.email user.email
+  #           # Add more attributes as needed
+  #         end
+  #       end
+  #     end
+  #   end.to_xml
+  # end
+
+  # index do
+  #   users do
+  #     row :request do |log|
+  #       if log.request
+  #         xml_string = Nokogiri::XML(log.request, &:noblanks).to_xml
+  #         "<pre>#{xml_string.gsub(/</, '&lt;').gsub(/>/, '&gt;')}</pre>".html_safe
+  #       end
+  #     end
+  #   end
+  # end
+  # controller do
+  #   def index
+  #     @users = User.find(:all)
+  #     send_data @users, filename: "user_#{params[:id]}.xml", type: "application/xml"
+  #   end
+  # end
+
+  action_item :download_xml, only: :index do
+    link_to 'Custom Download XML', { action: :index, format: :xml }
+  end
+
   index do
     selectable_column
     id_column
@@ -29,6 +93,9 @@ ActiveAdmin.register User do
     column :email
     column :created_at
     actions
+    column 'XML', :download_xml do |user|
+      link_to 'Download XML', { action: :show, format: :xml, id: user.id }
+    end
   end
   filter :organization
   filter :name, as: :select, collection: proc {User.pluck(:name)}
(END)


Something went wrong: 767: unexpected token at 'Error: station_43:station_43_backend is not recognized as a service.; It may not be registered with Supervisor yet. Restarting broadcasting may help. on /var/azuracast/www/src/Exception/SupervisorException.php L29'

Of course, here's an example of how you can implement the logout link with the confirm message in a Ruby on Rails application:

1. **View:**

In your view (for example, in `app/views/sessions/new.html.erb` if you're using a standard login view), you can add the logout link with the `data-confirm` attribute:

```erb
<%= link_to "Logout", logout_path, method: :delete, data: { confirm: "Are you sure you want to logout?" } %>
```

2. **Routes:**

Make sure your `config/routes.rb` file has the appropriate route defined for the logout action:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  # Other routes
  delete 'logout', to: 'sessions#destroy', as: :logout
end
```

3. **Controller:**

In your controller (for example, `app/controllers/sessions_controller.rb`), implement the logout action:

```ruby
class SessionsController < ApplicationController
  # Other actions

  def destroy
    # Logout logic here
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully."
  end
end
```

Make sure your controller is set up to handle the `DELETE` request method.

4. **JavaScript:**

Rails should automatically generate the required JavaScript for the confirmation dialog. However, if you're using Turbolinks, you might need to include the following JavaScript code in your application:

```javascript
// app/assets/javascripts/application.js (for non-Webpacker setup)
// OR
// app/javascript/packs/application.js (for Webpacker setup)

document.addEventListener("turbolinks:load", function() {
  $('[data-confirm]').on('click', function(e) {
    if (!confirm($(this).data('confirm'))) {
      e.preventDefault();
      e.stopPropagation();
    }
  });
});
```

This JavaScript code ensures that Turbolinks properly handles the `data-confirm` attribute.

Make sure you have the appropriate version of jQuery included in your application if this code snippet uses jQuery. If you're using Rails 6 or later, jQuery might not be included by default, so you may need to add it manually.

Remember to adjust the paths and names according to your application's structure and conventions.

Please try these steps and let me know if you encounter any further issues.


Certainly, I can help you with that! If you want to implement a confirmation message pop-up when a user tries to sign out in a Rails application, you can use JavaScript along with Rails' built-in `link_to` or `button_to` helper methods.

Here's a step-by-step guide on how to achieve this:

1. **Add a Confirmation Pop-up:**
   You can use JavaScript's `confirm` function to display a confirmation dialog box when the user clicks the sign-out link. If the user confirms, the sign-out action will proceed; if not, it will be canceled.

2. **Modify the View:**
   In your view template (e.g., `app/views/layouts/application.html.erb`), find the link or button that triggers the sign-out action. Modify it to include an `onclick` attribute that invokes the JavaScript confirmation dialog.

   ```erb
   <%= link_to "Sign Out", destroy_user_session_path, method: :delete, data: { confirm: "Are you sure you want to sign out?" } %>
   ```

   In the example above, the `data-confirm` attribute will trigger the JavaScript confirmation dialog.

3. **JavaScript Implementation:**
   Add a JavaScript snippet to handle the confirmation dialog and cancel the sign-out action if the user cancels the confirmation. You can place this script in your application's JavaScript file (e.g., `app/assets/javascripts/application.js`) or in a separate JavaScript file.

   ```javascript
   // app/assets/javascripts/application.js or a custom JS file
   document.addEventListener("DOMContentLoaded", function() {
     const signOutLinks = document.querySelectorAll('a[data-confirm]');

     signOutLinks.forEach(link => {
       link.addEventListener('click', function(event) {
         const confirmationMessage = link.getAttribute('data-confirm');

         if (!confirm(confirmationMessage)) {
           event.preventDefault();
         }
       });
     });
   });
   ```

   This script will attach an event listener to each link with the `data-confirm` attribute. When the link is clicked, the confirmation message will be displayed, and the event's default action (sign-out) will be prevented if the user cancels the confirmation.

Remember to adapt the code to your Rails version and project structure. This example assumes Rails 5+ and the default JavaScript setup.

Additionally, always make sure to test thoroughly to ensure the desired behavior and user experience.

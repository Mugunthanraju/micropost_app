module ApplicationHelper
    # Return the full title on a per-page basis.
    def full_title(page_title = '')
        base_title = "Micropost"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end

    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        # gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}"
        pravatar_url = "https://i.pravatar.cc/75?u=#{gravatar_id}"
        image_tag(pravatar_url, alt: user.name, class: "gravatar")
        # rh = "https://robohash.org/mail@{user.email}"
        # image_tag(rh, alt: user.name, class: "gravatar")
        # pa = "https://i.pravatar.cc/75?u=#{gravatar_id}"
        # image_tag(pa, alt: user.name, class: "gravatar")
    end

end

Spree::PaymentMethod.class_eval do

  def self.available_on_checkout(guest_checkout=false)
    all.select do |p|
      p.active && 
     # (p.display_on.blank? || p.display_on == "frontend" || p.display_on == "both") && #we don't want this for our needs
      (!guest_checkout || p.guest_checkout?) && 
      (p.environment == Rails.env || p.environment.blank?)
    end
  end

  def guest_checkout?
    true
  end
end

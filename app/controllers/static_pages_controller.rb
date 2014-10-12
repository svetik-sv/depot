class StaticPagesController < ApplicationController
skip_before_filter :authorize
  def faq
  end

  def news
  end

  def contact
  end
end

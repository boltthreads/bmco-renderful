# frozen_string_literal: true

module Renderful
  class Renderer
    class Rails < Renderer
      def render
        ActionController::Base.renderer.render(partial: view, locals: locals.merge(default_locals))
      end

      private

      def locals
        {}
      end

      def view
        "renderful/#{entry.content_type.id.demodulize.underscore}"
      end

      def default_locals
        { entry: entry, client: client, renderer: self }
      end
    end
  end
end

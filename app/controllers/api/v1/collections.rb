module API
  module V1
    class Collections < Grape::API
      include API::V1::Defaults

      resource :collections do
        desc "Return a collection"
        params do
          requires :id, type: String, desc: "ID of the collection"
        end
        get ":id", root: "collection" do
          Collection.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
module API
  module V1
    class Works < Grape::API
      include API::V1::Defaults

      resource :works do
        desc "Return all works"
        get "", root: :works do
          Work.all
        end

        desc "Return a work"
        params do
          requires :id, type: String, desc: "ID of the work"
        end
        get ":id", root: "work" do
          Work.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
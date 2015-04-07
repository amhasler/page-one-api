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

        desc "Create a work"
        params do
          requires :title, type: String, desc: "Title of the work"
          requires :date, type: String, desc: "Approximate date of work's creation"
          requires :place, type: String, desc: "Approximate location of creation"
          requires :collection, type: String, desc: "ID of the collection the work belongs to"
          optional :circa, type: Boolean, desc: "Whether the date is a description"
          optional :creator_list, type: String, desc: "Creator of the work, part of an array"
          optional :mode_list, type: String, desc: "The type of work, part of an array"
          optional :reference_list, type: String, desc: "The source of the work to the collection author"
        end
        post do
          work = Work.new(collection: Collection.find(permitted_params[:collection]))

          work.title = permitted_params[:title]
          work.date = permitted_params[:date]
          work.circa = permitted_params[:circa]
          work.place = permitted_params[:place]
          work.creator_list.add(permitted_params[:creator_list])
          work.mode_list.add(permitted_params[:mode_list])
          work.reference_list.add(permitted_params[:reference_list])

          work.save!
        end

        desc "Update a work"
        params do
          requires :id, type: String, desc: "ID of the work"
          requires :title, type: String, desc: "Title of the work"
          requires :date, type: String, desc: "Approximate date of work's creation"
          requires :place, type: String, desc: "Approximate location of creation"
          requires :collection, type: String, desc: "ID of the collection the work belongs to"
          optional :circa, type: Boolean, desc: "Whether the date is a description"
          optional :creator_list, type: String, desc: "Creator of the work, part of an array"
          optional :mode_list, type: String, desc: "The type of work, part of an array"
          optional :reference_list, type: String, desc: "The source of the work to the collection author"
        end
        put do
          work = Work.find(permitted_params[:id])

          work.title = permitted_params[:title]
          work.date = permitted_params[:date]
          work.circa = permitted_params[:circa]
          work.place = permitted_params[:place]
          work.creator_list.add(permitted_params[:creator_list])
          work.mode_list.add(permitted_params[:mode_list])
          work.reference_list.add(permitted_params[:reference_list])

          work.save!
        end

        desc "Destroy a work"
        params do
          requires :id, type: String, desc: "ID of the work"
        end
        delete do
          work = Work.find(permitted_params[:id])
          work.destroy
        end
      end
    end
  end
end
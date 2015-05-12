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
          optional :title, type: String, desc: "Title of the work"
          optional :date, type: String, desc: "Approximate date of work's creation"
          optional :place, type: String, desc: "Approximate location of creation"
          requires :collection, type: String, desc: "ID of the collection the work belongs to"
          #optional :circa, type: Boolean, desc: "Whether the date is a description"
          #optional :creator_list, type: String, desc: "Creator of the work, part of an array"
          #optional :mode_list, type: String, desc: "The type of work, part of an array"
          #optional :reference_list, type: String, desc: "The source of the work to the collection author"
        end
        post do
          puts params

          work = Work.new(collection: Collection.find(permitted_params[:collection]))

          work.title = params[:title]
          
          work.date = params[:date]
          work.circa = params[:circa]
          work.place = params[:place]
          #work.creator_list.add(permitted_params[:creator_list])
          #work.mode_list.add(permitted_params[:mode_list])
          #work.reference_list.add(permitted_params[:reference_list])

          work.save!
          work
        end

        desc "Update a work"
        params do
          requires :id, type: String, desc: "ID of the work"
          optional :title, type: String, desc: "Title of the work"
          optional :date, type: String, desc: "Approximate date of work's creation"
          optional :place, type: String, desc: "Approximate location of creation"
          optional :collection, type: String, desc: "ID of the collection the work belongs to"
          optional :circa, type: Boolean, desc: "Whether the date is a description"
          # optional :creator_list, type: String, desc: "Creator of the work, part of an array"
          # optional :mode_list, type: String, desc: "The type of work, part of an array"
          # optional :reference_list, type: String, desc: "The source of the work to the collection author"
        end
        put ":id", root: "work" do
          work = Work.find(permitted_params[:id])

          work.title = permitted_params[:title]
          work.date = permitted_params[:date]
          work.circa = permitted_params[:circa]
          work.place = permitted_params[:place]
          # work.creator_list.add(permitted_params[:creator_list])
          # work.mode_list.add(permitted_params[:mode_list])
          # work.reference_list.add(permitted_params[:reference_list])

          work.save

          work
        end

        desc "Destroy a work"
        params do
          requires :id, type: String, desc: "ID of the work"
        end
        delete ":id", root: "work" do
          work = Work.find(permitted_params[:id])
          work.destroy
        end
      end
    end
  end
end
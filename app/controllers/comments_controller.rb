class CommentsController < ApplicationController
  before_action :set_house
  before_action :set_comment, only: [:like, :show]

  def create
    @comment = @house.comments.create(comment_params)
    render json: { comment: @comment, html: render_to_string(partial: 'houses/comment', object: @comment) }
  end

  def like
    @comment.like!
    render json: { comment: @comment }
  end

  def show
    respond_to do |format|
      format.pdf do
        params = {
          page_size: [396, 235],
          top_margin: 0,
          bottom_margin: 0,
          left_margin: 0,
          right_margin: 0
        }
        message = @comment.body
        url = url_for(@house)
        pdf = Prawn::Document.new(params)
        pdf.image 'vendor/assets/images/background.png', at: [0, 235], width: 396
        if message
          pdf.font 'vendor/fonts/ipag.ttf'
          pdf.draw_text message, at: [80, 235 - 110], size: 14
        end
        Tempfile.open('qrcode') do |io|
          qr = RQRCode::QRCode.new(url, size: 6, level: :h)
          png = qr.to_img
          png.save(io.path)
          pdf.image io.path, at: [396 - 140, 60 + 45], width: 60
        end
        # pdf = Prawn::Document.new
        # pdf.font 'vendor/fonts/ipag.ttf'
        # pdf.text 'こんにちは、プローン'
        send_data pdf.render,
                  filename:    "#{@house.id}.pdf",
                  type:        "application/pdf",
                  disposition: "inline"

      end
    end
  end

  private

  def set_house
    @house = House.find(params[:house_id])
  end

  def set_comment
    @comment = @house.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

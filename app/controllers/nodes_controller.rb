class NodesController < ApplicationController
  def index
    @nodes = Node.roots

    # ここで親階層扱いにしたい構成部品一覧を取得
    # @nodes = EngineComponent.where(レベル２まで、アドレスあり、engine_no=current).order("address")
  end

  def children
    @nodes = Node.find(params[:id].to_i).children

    # まずは選択された親要素を取得
    # parent = EngineComponent.find(params[:id].to_i)

    # 子供の要素を特定
    # @nodes = EngineComponent.where(レベルが親要素＋１、アドレスに親要素のアドレスを含む、engine_no=current).order("address")

    render layout: false
  end

  # def update
  #   @node = Node.find(params[:id].to_i)
  #   @node.update_attributes(params[:node])

  #   render text: ""
  # end
end

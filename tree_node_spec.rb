require "./tree_node"

describe "TreeNode" do
  subject(:tree_node) { TreeNode.new("tree_root") }
  let(:left_child) { TreeNode.new("left") }
  let(:right_child) { TreeNode.new("right") }
  let(:lleft_child) { TreeNode.new("lkidz") }
  let(:lright_child) { TreeNode.new("right") }


  it { should respond_to(:parent) }
  it { should respond_to(:left) }
  it { should respond_to(:right) }
  it { should respond_to(:value) }

  describe "#left" do

    it "should be able to set a child's parent" do
      left_child.should_receive(:parent=).with(tree_node)

      tree_node.left = left_child
    end

    it "should be able to set its own child" do
      tree_node.left = left_child

      tree_node.left.should == left_child
    end

    it "should reset previous left child's parent to nil" do
      tree_node.left = left_child
      tree_node.left = right_child

      left_child.parent.should == nil
    end
  end

  describe "#right" do

    it "should be able to set a child's parent" do
      right_child.should_receive(:parent=).with(tree_node)

      tree_node.right = right_child
    end

    it "should be able to set its own child" do
      tree_node.right = right_child
      tree_node.right.should == right_child
    end

    it "should reset previous left child's parent to nil" do
      tree_node.right = right_child
      tree_node.right = left_child

      right_child.parent.should == nil
    end
  end

  describe "#parent" do

    it "should change its parent value" do
      left_child.parent = tree_node
      left_child.parent.should == tree_node
    end

  end

  describe "#bfs" do
    it "should find child at desired value" do
      tree_node.left = left_child
      tree_node.right = right_child

      tree_node.bfs("right").should eq(["tree_root", "right"])
    end

    it "should return the first child with the desired value" do
      tree_node.left = left_child
      tree_node.right = right_child
      left_child.left = lleft_child
      left_child.right = lright_child

      tree_node.bfs("right").should eq(["tree_root", "right"])
    end
  end
end
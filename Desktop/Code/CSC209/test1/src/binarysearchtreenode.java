public class binarysearchtreenode {

        int info ;


    public class BinarySearchTreeNode{
        private int info ;
        BinarySearchTreeNode left,right ;

        public BinarySearchTreeNode(int info, BinarySearchTreeNode left, BinarySearchTreeNode right) {
            this.info = info;
            this.left = left;
            this.right = right;
        }
        public int getInfo() {
            return info ;
        }

        public void setInfo(int info) {
            this.info = info;
        }
    }

}

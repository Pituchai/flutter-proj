public class BinarySearchTree extends binarysearchtreenode {
    BinarySearchTreeNode root;

    public BinarySearchTree() {
    root = null ;
    }


    public void addNewNode(int newInfo){
        BinarySearchTreeNode temp = root;
        if(root == null) {
          root = new BinarySearchTreeNode(newInfo,null,null) ;
        }
        while(true) {
            if(newInfo <temp.getInfo() && temp.left !=null) {
                temp = temp.left ;
            }
            else if(newInfo >=temp.getInfo()&&temp.right !=null) {
                temp = temp.right    ;
            }
            else if(newInfo < temp.getInfo() ) {
                new binarysearchtreenode.BinarySearchTreeNode(newInfo, null,null) ;
                break;
            }
            else {
                    temp.right = new BinarySearchTreeNode(newInfo,null,null) ;
                    break ;
            }

        }
    }

    public BinarySearchTreeNode search(int key) {
            BinarySearchTreeNode temp = root ;
            while (temp != null && temp.getInfo() != key ) {
                if(key < temp.getInfo()) {
                    temp = temp.left ;
                }
                else {
                    temp = temp.right ;
                }
            }
            return temp ;
    }

}

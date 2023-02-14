public class BinarySerchTreeLab {
    public static void main(String[] args) {
         BinarySearchTree tree1 = new BinarySearchTree() ;
        tree1.addNewNode(50);
        System.out.println(tree1.root.getInfo());
        tree1.addNewNode(20);
        System.out.println(tree1.root.getInfo());
        tree1.addNewNode(40);

        System.out.println(tree1.root.left.right.getInfo());

        tree1.addNewNode(100); tree1.addNewNode(150);
        tree1.addNewNode(100000); tree1.addNewNode(50);

        System.out.println(tree1.root.right.right.right.right.getInfo()) ;

        binarysearchtreenode.BinarySearchTreeNode x = tree1.search(150);
            if(x !=null) {
                System.out.println("Found" + x.getInfo()) ;
            }
            else{
                System.out.println("Not Found");
            }



    }
}

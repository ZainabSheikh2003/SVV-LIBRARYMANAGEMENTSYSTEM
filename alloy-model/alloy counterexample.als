sig Student {}

sig Book {}

one sig Library {
    issued : Book -> lone Student
}

fact OneBookOneStudent {
    all b : Book |
        lone (Library.issued[b])
}

/* intentionally NO MaxThreeBooksRule */

/* force check for violation */
assert NoStudentHasMoreThan3Books {
    all s : Student |
        #(Library.issued.s) <= 3
}

check NoStudentHasMoreThan3Books for 5

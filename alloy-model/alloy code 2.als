sig Student {}

sig Book {}

one sig Library {
    issued : Book -> lone Student
}

/* Constraint: A student can issue at most 3 books */
fact MaxThreeBooksRule {
    all s : Student |
        #(Library.issued.s) <= 3
}

/* Constraint: One book can belong to only one student */
fact OneBookOneStudent {
    all b : Book |
        lone (Library.issued[b])
}

/* Assertion: No student should have more than 3 books */
assert NoStudentHasMoreThan3Books {
    all s : Student |
        #(Library.issued.s) <= 3
}

/* Assertion: No book issued to multiple students */
assert NoBookIssuedToMultipleStudents {
    all b : Book |
        lone (Library.issued[b])
}

/* Verification */
check NoStudentHasMoreThan3Books for 5
check NoBookIssuedToMultipleStudents for 5

/* Example instance generation */
run {} for 5

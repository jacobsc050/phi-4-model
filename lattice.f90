module lattice_maker
    implicit none 
    contains
    subroutine lattice_make(dimension, size, lattice)
        !For an Nth dimensional lattice
        integer, intent(in) :: dimension, size
    
        integer :: x,latticeCount,index, i
        real, dimension(:),  intent(out),  allocatable :: lattice

        real :: y
    
     
        ! Calculate the required array index size for the 1 dimensional array indexing
        
        latticeCount = size ** dimension
        
        Write(*,*) "Total lattice index size is ", latticeCount,"."

        
        allocate(lattice(latticeCount))

        !~~~ I know fortrans RNG is bad, this is placeholder for now ~~~
        ! (sorry paul :) ) 

        do i = 1, latticeCount
            call random_number(y) 
            lattice(i) = y * 10
        end do 

    
        ! Determine print format and then print out randomly generated numbers 
        if(dimension == 2) then
            ! print out formatted numbers (only works to 2d)
            index = 1
            do i = 1, size
                do x = 1, size
                    write(*, '(A, F10.5, A)',advance='no' ) " ", lattice(index), ", "
                    index = index + 1
                end do
                write(*,*)
            end do
        else 
            ! Print out the randomly generated numbers in 1D format
            write(*,*) "Randomly generated numbers in 1d format"
            do i = 1, latticeCount 
            write(*,*)  i ,":", lattice(i)
            end do
        end if
        
    end subroutine lattice_make

end module lattice_maker 
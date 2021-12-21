import React from 'react';

const Pagination = ({postPerPage, totalPosts, paginate, blocknate, pagePerBlock, currentPage, currentBlock}) => {
const pageNumbers = [];
const totalPages = Math.ceil(totalPosts/postPerPage);
const Block = Math.ceil(currentPage/pagePerBlock);
blocknate(Block);

for (let i=(currentBlock*pagePerBlock)-(pagePerBlock-1); i<=currentBlock*pagePerBlock; i ++) {
    if (i>totalPages){
        break;
    }
    pageNumbers.push(i);
}

    return (
        <nav>
            <ul className="pagination">
                {
                   currentPage>1
                   ?<li><a onClick={() => paginate(currentPage-1)} href='!#'>이전</a></li>
                   : null
               }
                {pageNumbers.map(num => 
                    <li key={num}>
                        <a onClick={() => paginate(num)} href='!#'>{num}</a>
                    </li>)}
               {
                   currentPage<totalPages
                   ?<li><a onClick={() => paginate(currentPage+1)} href='!#'>다음</a></li>
                   : null
               }
            </ul>
        </nav>
    );
};

export default Pagination;
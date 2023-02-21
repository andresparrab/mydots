using Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace API.Controllers
{
    public class GroceriesController : BaseApiController
    {
        private readonly DataContext _context;
        public GroceriesController(DataContext context)
        {
            _context = context;
        }

        [HttpGet] //api/groceries
        public async Task<ActionResult<List<Groceries>>> GetGroceries()
        {
            // System.Console.WriteLine("lol");
            return await _context.Groceries.ToListAsync();
        }

        [HttpGet("{id}")] //api/groceries/
        public async Task<ActionResult<Groceries>> GetGroceries(Guid id)
        {
            return await _context.Groceries.FindAsync(id);
        }
    }
}

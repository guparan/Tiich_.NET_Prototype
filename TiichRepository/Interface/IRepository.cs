﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utils;

namespace TiichRepository.Interface
{
    public interface IRepository<T>
    {
        void Add(T obj, ErrorHandler eh, List<object> toAttach = null);
        void Edit(T obj, ErrorHandler eh);
        void Delete(int id, ErrorHandler eh);
        void GenericTests(T obj, ErrorHandler eh);
        List<T> GetAll(int taken = -1, List<string> toInclude = null);
    }
}

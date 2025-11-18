import React, { useState } from 'react';
import { ChevronRight, User, Mail, Calendar, AlertCircle, CheckCircle } from 'lucide-react';

export default function FlutterUTSApp() {
  const [currentPage, setCurrentPage] = useState('home');
  const [userData, setUserData] = useState(null);
  const [formData, setFormData] = useState({
    nama: '',
    email: '',
    umur: ''
  });
  const [errors, setErrors] = useState({});
  const [showSuccess, setShowSuccess] = useState(false);

  // Validasi Form
  const validateForm = () => {
    const newErrors = {};

    // Validasi Nama (wajib diisi)
    if (!formData.nama.trim()) {
      newErrors.nama = 'Nama wajib diisi';
    }

    // Validasi Email (wajib diisi dan format benar)
    if (!formData.email.trim()) {
      newErrors.email = 'Email wajib diisi';
    } else if (!formData.email.includes('@')) {
      newErrors.email = 'Email harus mengandung karakter @';
    }

    // Validasi Umur (wajib diisi dan harus angka positif > 0)
    if (!formData.umur.trim()) {
      newErrors.umur = 'Umur wajib diisi';
    } else if (isNaN(formData.umur) || Number(formData.umur) <= 0) {
      newErrors.umur = 'Umur harus berupa angka positif (> 0)';
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  // Handle Submit Form
  const handleSubmit = () => {
    if (validateForm()) {
      setUserData({
        nama: formData.nama,
        email: formData.email,
        umur: formData.umur
      });
      setShowSuccess(true);
      setTimeout(() => {
        setShowSuccess(false);
        setCurrentPage('home');
        setFormData({ nama: '', email: '', umur: '' });
        setErrors({});
      }, 1500);
    }
  };

  // Handle Input Change
  const handleInputChange = (field, value) => {
    setFormData(prev => ({
      ...prev,
      [field]: value
    }));
    if (errors[field]) {
      setErrors(prev => ({
        ...prev,
        [field]: ''
      }));
    }
  };

  // Navigator.push() - Pindah ke FormPage
  const navigateToForm = () => {
    setCurrentPage('form');
  };

  // Navigator.pop() - Kembali ke HomePage
  const navigateBack = () => {
    setCurrentPage('home');
    setFormData({ nama: '', email: '', umur: '' });
    setErrors({});
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      <div className="max-w-4xl mx-auto">
        {currentPage === 'home' ? (
          <div className="min-h-screen flex flex-col">
            <div className="bg-gradient-to-r from-blue-600 to-indigo-600 text-white p-6 shadow-lg">
              <div className="flex items-center gap-3">
                <User size={28} />
                <h1 className="text-2xl font-bold">Data Pengguna</h1>
              </div>
            </div>

            <div className="flex-1 p-6">
              <div className="space-y-6">
                {userData ? (
                  <div className="bg-white rounded-2xl shadow-xl p-8 border-2 border-blue-100">
                    <div className="flex items-center gap-2 mb-6">
                      <CheckCircle className="text-green-500" size={24} />
                      <h2 className="text-xl font-bold text-gray-800">Informasi Pengguna</h2>
                    </div>
                    
                    <div className="space-y-4">
                      <div className="flex items-center gap-4 p-4 bg-blue-50 rounded-xl">
                        <User className="text-blue-600" size={24} />
                        <div className="flex-1">
                          <p className="text-sm text-gray-500 font-medium">Nama Lengkap</p>
                          <p className="text-lg font-bold text-gray-800">{userData.nama}</p>
                        </div>
                      </div>

                      <div className="flex items-center gap-4 p-4 bg-indigo-50 rounded-xl">
                        <Mail className="text-indigo-600" size={24} />
                        <div className="flex-1">
                          <p className="text-sm text-gray-500 font-medium">Email</p>
                          <p className="text-lg font-bold text-gray-800">{userData.email}</p>
                        </div>
                      </div>

                      <div className="flex items-center gap-4 p-4 bg-purple-50 rounded-xl">
                        <Calendar className="text-purple-600" size={24} />
                        <div className="flex-1">
                          <p className="text-sm text-gray-500 font-medium">Umur</p>
                          <p className="text-lg font-bold text-gray-800">{userData.umur} tahun</p>
                        </div>
                      </div>
                    </div>
                  </div>
                ) : (
                  <div className="bg-white rounded-2xl shadow-xl p-12 text-center border-2 border-dashed border-gray-300">
                    <User size={64} className="mx-auto text-gray-300 mb-4" />
                    <p className="text-xl text-gray-500 font-medium">Belum ada data pengguna</p>
                    <p className="text-sm text-gray-400 mt-2">Silakan input data melalui form</p>
                  </div>
                )}

                <button
                  onClick={navigateToForm}
                  className="w-full bg-gradient-to-r from-blue-600 to-indigo-600 text-white py-4 px-6 rounded-xl font-bold text-lg shadow-lg hover:shadow-xl hover:from-blue-700 hover:to-indigo-700 transition-all duration-300 flex items-center justify-center gap-3"
                >
                  <span>Input Data Pengguna</span>
                  <ChevronRight size={24} />
                </button>
              </div>
            </div>
          </div>
        ) : (
          <div className="min-h-screen flex flex-col">
            <div className="bg-gradient-to-r from-indigo-600 to-purple-600 text-white p-6 shadow-lg">
              <div className="flex items-center gap-3">
                <Mail size={28} />
                <h1 className="text-2xl font-bold">Form Input Data</h1>
              </div>
            </div>

            <div className="flex-1 p-6">
              {showSuccess && (
                <div className="mb-6 bg-green-100 border-2 border-green-500 text-green-800 p-4 rounded-xl flex items-center gap-3 animate-pulse">
                  <CheckCircle size={24} />
                  <span className="font-bold">Data berhasil disimpan!</span>
                </div>
              )}

              <div className="bg-white rounded-2xl shadow-xl p-8 border-2 border-indigo-100">
                <h2 className="text-xl font-bold text-gray-800 mb-6">Formulir Data Pengguna</h2>
                
                <div className="space-y-6">
                  <div>
                    <label className="block text-sm font-bold text-gray-700 mb-2">
                      Nama Lengkap <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="text"
                      value={formData.nama}
                      onChange={(e) => handleInputChange('nama', e.target.value)}
                      placeholder="Masukkan nama lengkap"
                      className={`w-full p-4 border-2 rounded-xl focus:outline-none focus:ring-2 transition-all ${
                        errors.nama
                          ? 'border-red-300 focus:border-red-500 focus:ring-red-200'
                          : 'border-gray-300 focus:border-indigo-500 focus:ring-indigo-200'
                      }`}
                    />
                    {errors.nama && (
                      <div className="flex items-center gap-2 mt-2 text-red-600 text-sm">
                        <AlertCircle size={16} />
                        <span>{errors.nama}</span>
                      </div>
                    )}
                  </div>

                  <div>
                    <label className="block text-sm font-bold text-gray-700 mb-2">
                      Email <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="email"
                      value={formData.email}
                      onChange={(e) => handleInputChange('email', e.target.value)}
                      placeholder="contoh@email.com"
                      className={`w-full p-4 border-2 rounded-xl focus:outline-none focus:ring-2 transition-all ${
                        errors.email
                          ? 'border-red-300 focus:border-red-500 focus:ring-red-200'
                          : 'border-gray-300 focus:border-indigo-500 focus:ring-indigo-200'
                      }`}
                    />
                    {errors.email && (
                      <div className="flex items-center gap-2 mt-2 text-red-600 text-sm">
                        <AlertCircle size={16} />
                        <span>{errors.email}</span>
                      </div>
                    )}
                  </div>

                  <div>
                    <label className="block text-sm font-bold text-gray-700 mb-2">
                      Umur <span className="text-red-500">*</span>
                    </label>
                    <input
                      type="number"
                      value={formData.umur}
                      onChange={(e) => handleInputChange('umur', e.target.value)}
                      placeholder="Masukkan umur"
                      className={`w-full p-4 border-2 rounded-xl focus:outline-none focus:ring-2 transition-all ${
                        errors.umur
                          ? 'border-red-300 focus:border-red-500 focus:ring-red-200'
                          : 'border-gray-300 focus:border-indigo-500 focus:ring-indigo-200'
                      }`}
                    />
                    {errors.umur && (
                      <div className="flex items-center gap-2 mt-2 text-red-600 text-sm">
                        <AlertCircle size={16} />
                        <span>{errors.umur}</span>
                      </div>
                    )}
                  </div>

                  <div className="flex gap-4 pt-4">
                    <button
                      onClick={handleSubmit}
                      className="flex-1 bg-gradient-to-r from-green-600 to-emerald-600 text-white py-4 px-6 rounded-xl font-bold text-lg shadow-lg hover:shadow-xl hover:from-green-700 hover:to-emerald-700 transition-all duration-300"
                    >
                      Simpan Data
                    </button>

                    <button
                      onClick={navigateBack}
                      className="flex-1 bg-gradient-to-r from-gray-500 to-gray-600 text-white py-4 px-6 rounded-xl font-bold text-lg shadow-lg hover:shadow-xl hover:from-gray-600 hover:to-gray-700 transition-all duration-300"
                    >
                      Batal
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
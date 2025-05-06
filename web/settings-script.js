// Initialize when document loads
document.addEventListener('DOMContentLoaded', function() {
    // Tab navigation
    initTabNavigation();
    
    // Initialize Vue apps
    initVueApps();
});

/**
 * Initialize tab navigation functionality
 */
function initTabNavigation() {
    const tabs = document.querySelectorAll('.nav-tabs .nav-link');
    
    tabs.forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Hide all tab panes
            document.querySelectorAll('.tab-pane').forEach(pane => {
                pane.classList.remove('active');
            });
            
            // Deactivate all tabs
            tabs.forEach(t => {
                t.classList.remove('active');
            });
            
            // Activate clicked tab
            this.classList.add('active');
            
            // Show corresponding pane
            const target = this.getAttribute('href');
            document.querySelector(target).classList.add('active');
        });
    });
}

/**
 * Initialize all Vue applications
 */
function initVueApps() {
    // Staff Management App
    const staffApp = Vue.createApp({
        data() {
            return {
                activeStaffType: 'supervisors',
                editingSupervisorId: null,
                editingPorterId: null
            }
        },
        methods: {
            startEditing(id, type) {
                if (type === 'supervisor') {
                    this.editingSupervisorId = id;
                    this.editingPorterId = null;
                } else if (type === 'porter') {
                    this.editingPorterId = id;
                    this.editingSupervisorId = null;
                }
            },
            
            cancelEdit(type) {
                if (type === 'supervisor') {
                    this.editingSupervisorId = null;
                } else if (type === 'porter') {
                    this.editingPorterId = null;
                }
            },
            
            submitStaffEdit(e, id, type) {
                const formData = new FormData(e.target);
                
                // Display loading state
                const submitBtn = e.target.querySelector('button[type="submit"]');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'Saving...';
                submitBtn.disabled = true;
                
                // Ensure CSRF token is included
                if (!formData.has('CRAFT_CSRF_TOKEN')) {
                    const csrfTokenElement = document.querySelector('input[name="CRAFT_CSRF_TOKEN"]');
                    if (csrfTokenElement) {
                        formData.append('CRAFT_CSRF_TOKEN', csrfTokenElement.value);
                    }
                }
                
                // Make sure elementType is set
                if (!formData.has('elementType')) {
                    formData.append('elementType', 'craft\\elements\\Entry');
                }
                
                // Ensure siteId is set
                if (!formData.has('siteId')) {
                    // Try to find siteId in the document
                    const siteIdElement = document.querySelector('input[name="siteId"]');
                    if (siteIdElement) {
                        formData.append('siteId', siteIdElement.value);
                    }
                }
                
                fetch('', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        return response.text().then(html => {
                            // Try to extract error message from response
                            try {
                                const jsonResponse = JSON.parse(html);
                                if (jsonResponse.error) {
                                    throw new Error(jsonResponse.error);
                                }
                            } catch (e) {
                                // If it's not JSON or doesn't have an error property
                                console.error("Response:", html);
                                throw new Error('Submission failed');
                            }
                        });
                    }
                    return response.text();
                })
                .then(html => {
                    // Show success notification
                    const notification = document.createElement('div');
                    notification.className = 'notification success';
                    notification.textContent = `${type.charAt(0).toUpperCase() + type.slice(1)} has been updated successfully!`;
                    
                    // Insert notification
                    const formParent = e.target.closest('.staff-card-edit-form');
                    formParent.appendChild(notification);
                    
                    // Reset edit state
                    setTimeout(() => {
                        this.cancelEdit(type);
                        location.reload(); // Refresh to show updated data
                    }, 1500);
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert(`There was an error updating the ${type}. Please try again.`);
                    
                    // Reset button state
                    submitBtn.textContent = originalText;
                    submitBtn.disabled = false;
                });
            }
        }
    });
    
    // Locations App
    const locationsApp = Vue.createApp({
        data() {
            return {
                activeBuildingId: null,
                departmentName: '',
                editingBuildingId: null,
                editingDepartmentId: null
            }
        },
        methods: {
            showAddForm(buildingId) {
                if (this.activeBuildingId === buildingId) {
                    this.activeBuildingId = null;
                } else {
                    this.activeBuildingId = buildingId;
                    this.departmentName = '';
                }
            },
            
            cancelAdd() {
                this.activeBuildingId = null;
                this.departmentName = '';
            },
            
            submitChildForm(e, parentId) {
                if (!this.departmentName.trim()) {
                    alert('Please enter a department name');
                    return;
                }
                
                const formData = new FormData(e.target);
                
                // Show loading state
                const submitBtn = e.target.querySelector('button[type="submit"]');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'Adding...';
                submitBtn.disabled = true;
                
                // Ensure CSRF token is included
                if (!formData.has('CRAFT_CSRF_TOKEN')) {
                    const csrfTokenElement = document.querySelector('input[name="CRAFT_CSRF_TOKEN"]');
                    if (csrfTokenElement) {
                        formData.append('CRAFT_CSRF_TOKEN', csrfTokenElement.value);
                    }
                }
                
                // Make sure elementType is set
                if (!formData.has('elementType')) {
                    formData.append('elementType', 'craft\\elements\\Entry');
                }
                
                // Ensure siteId is set
                if (!formData.has('siteId')) {
                    // Try to find siteId in the document
                    const siteIdElement = document.querySelector('input[name="siteId"]');
                    if (siteIdElement) {
                        formData.append('siteId', siteIdElement.value);
                    }
                }
                
                fetch('', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(html => {
                    // Show success notification
                    const notification = document.createElement('div');
                    notification.className = 'notification success';
                    notification.textContent = 'Department has been added successfully!';
                    
                    // Insert notification
                    const formParent = e.target.closest('.inline-department-form');
                    formParent.appendChild(notification);
                    
                    // Reset form
                    setTimeout(() => {
                        this.cancelAdd();
                        location.reload(); // Refresh to show new department
                    }, 1500);
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('There was an error adding the department. Please try again.');
                    
                    // Reset button state
                    submitBtn.textContent = originalText;
                    submitBtn.disabled = false;
                });
            },
            
            startBuildingEdit(id) {
                this.editingBuildingId = id;
            },
            
            cancelBuildingEdit() {
                this.editingBuildingId = null;
            },
            
            submitBuildingEdit(e, id) {
                const formData = new FormData(e.target);
                
                // Show loading state
                const submitBtn = e.target.querySelector('button[type="submit"]');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'Saving...';
                submitBtn.disabled = true;
                
                // Ensure CSRF token is included
                if (!formData.has('CRAFT_CSRF_TOKEN')) {
                    const csrfTokenElement = document.querySelector('input[name="CRAFT_CSRF_TOKEN"]');
                    if (csrfTokenElement) {
                        formData.append('CRAFT_CSRF_TOKEN', csrfTokenElement.value);
                    }
                }
                
                // Ensure proper action is set
                if (!formData.has('action')) {
                    formData.append('action', 'guest-entries/save');
                }
                
                fetch('', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(html => {
                    // Show success notification
                    const notification = document.createElement('div');
                    notification.className = 'notification success';
                    notification.textContent = 'Building has been updated successfully!';
                    
                    // Insert notification
                    const formParent = e.target.closest('.location-title-edit');
                    formParent.appendChild(notification);
                    
                    // Reset edit state
                    setTimeout(() => {
                        this.cancelBuildingEdit();
                        location.reload(); // Refresh to show updated data
                    }, 1500);
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('There was an error updating the building. Please try again.');
                    
                    // Reset button state
                    submitBtn.textContent = originalText;
                    submitBtn.disabled = false;
                });
            },
            
            startDepartmentEdit(id) {
                this.editingDepartmentId = id;
            },
            
            cancelDepartmentEdit() {
                this.editingDepartmentId = null;
            },
            
            submitDepartmentEdit(e, id) {
                const formData = new FormData(e.target);
                
                // Show loading state
                const submitBtn = e.target.querySelector('button[type="submit"]');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'Saving...';
                submitBtn.disabled = true;
                
                // Ensure CSRF token is included
                if (!formData.has('CRAFT_CSRF_TOKEN')) {
                    const csrfTokenElement = document.querySelector('input[name="CRAFT_CSRF_TOKEN"]');
                    if (csrfTokenElement) {
                        formData.append('CRAFT_CSRF_TOKEN', csrfTokenElement.value);
                    }
                }
                
                // Ensure proper action is set
                if (!formData.has('action')) {
                    formData.append('action', 'guest-entries/save');
                }
                
                fetch('', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(html => {
                    // Show success notification
                    const notification = document.createElement('div');
                    notification.className = 'notification success';
                    notification.textContent = 'Department has been updated successfully!';
                    
                    // Insert notification
                    const formParent = e.target.closest('.location-title-edit');
                    formParent.appendChild(notification);
                    
                    // Reset edit state
                    setTimeout(() => {
                        this.cancelDepartmentEdit();
                        location.reload(); // Refresh to show updated data
                    }, 1500);
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('There was an error updating the department. Please try again.');
                    
                    // Reset button state
                    submitBtn.textContent = originalText;
                    submitBtn.disabled = false;
                });
            }
        }
    });
    
    // Task Categories App
    const categoriesApp = Vue.createApp({
        data() {
            return {
                activeCategoryId: null,
                subcategoryName: '',
                editingCategoryId: null,
                editingSubcategoryId: null
            }
        },
        methods: {
            showAddForm(categoryId) {
                if (this.activeCategoryId === categoryId) {
                    this.activeCategoryId = null;
                } else {
                    this.activeCategoryId = categoryId;
                    this.subcategoryName = '';
                }
            },
            
            cancelAdd() {
                this.activeCategoryId = null;
                this.subcategoryName = '';
            },
            
            submitChildForm(e, parentId) {
                if (!this.subcategoryName.trim()) {
                    alert('Please enter a subcategory name');
                    return;
                }
                
                const formData = new FormData(e.target);
                
                // Show loading state
                const submitBtn = e.target.querySelector('button[type="submit"]');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'Adding...';
                submitBtn.disabled = true;
                
                // Ensure CSRF token is included
                if (!formData.has('CRAFT_CSRF_TOKEN')) {
                    const csrfTokenElement = document.querySelector('input[name="CRAFT_CSRF_TOKEN"]');
                    if (csrfTokenElement) {
                        formData.append('CRAFT_CSRF_TOKEN', csrfTokenElement.value);
                    }
                }
                
                // Ensure proper action is set
                if (!formData.has('action')) {
                    formData.append('action', 'guest-entries/save');
                }
                
                fetch('', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(html => {
                    // Show success notification
                    const notification = document.createElement('div');
                    notification.className = 'notification success';
                    notification.textContent = 'Subcategory has been added successfully!';
                    
                    // Insert notification
                    const formParent = e.target.closest('.inline-subcategory-form');
                    formParent.appendChild(notification);
                    
                    // Reset form
                    setTimeout(() => {
                        this.cancelAdd();
                        location.reload(); // Refresh to show new subcategory
                    }, 1500);
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('There was an error adding the subcategory. Please try again.');
                    
                    // Reset button state
                    submitBtn.textContent = originalText;
                    submitBtn.disabled = false;
                });
            },
            
            startCategoryEdit(id) {
                this.editingCategoryId = id;
            },
            
            cancelCategoryEdit() {
                this.editingCategoryId = null;
            },
            
            submitCategoryEdit(e, id) {
                const formData = new FormData(e.target);
                
                // Show loading state
                const submitBtn = e.target.querySelector('button[type="submit"]');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'Saving...';
                submitBtn.disabled = true;
                
                // Ensure CSRF token is included
                if (!formData.has('CRAFT_CSRF_TOKEN')) {
                    const csrfTokenElement = document.querySelector('input[name="CRAFT_CSRF_TOKEN"]');
                    if (csrfTokenElement) {
                        formData.append('CRAFT_CSRF_TOKEN', csrfTokenElement.value);
                    }
                }
                
                // Ensure proper action is set
                if (!formData.has('action')) {
                    formData.append('action', 'guest-entries/save');
                }
                
                fetch('', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(html => {
                    // Show success notification
                    const notification = document.createElement('div');
                    notification.className = 'notification success';
                    notification.textContent = 'Category has been updated successfully!';
                    
                    // Insert notification
                    const formParent = e.target.closest('.category-title-edit');
                    formParent.appendChild(notification);
                    
                    // Reset edit state
                    setTimeout(() => {
                        this.cancelCategoryEdit();
                        location.reload(); // Refresh to show updated data
                    }, 1500);
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('There was an error updating the category. Please try again.');
                    
                    // Reset button state
                    submitBtn.textContent = originalText;
                    submitBtn.disabled = false;
                });
            },
            
            startSubcategoryEdit(id) {
                this.editingSubcategoryId = id;
            },
            
            cancelSubcategoryEdit() {
                this.editingSubcategoryId = null;
            },
            
            submitSubcategoryEdit(e, id) {
                const formData = new FormData(e.target);
                
                // Show loading state
                const submitBtn = e.target.querySelector('button[type="submit"]');
                const originalText = submitBtn.textContent;
                submitBtn.textContent = 'Saving...';
                submitBtn.disabled = true;
                
                // Ensure CSRF token is included
                if (!formData.has('CRAFT_CSRF_TOKEN')) {
                    const csrfTokenElement = document.querySelector('input[name="CRAFT_CSRF_TOKEN"]');
                    if (csrfTokenElement) {
                        formData.append('CRAFT_CSRF_TOKEN', csrfTokenElement.value);
                    }
                }
                
                // Ensure proper action is set
                if (!formData.has('action')) {
                    formData.append('action', 'guest-entries/save');
                }
                
                fetch('', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(html => {
                    // Show success notification
                    const notification = document.createElement('div');
                    notification.className = 'notification success';
                    notification.textContent = 'Subcategory has been updated successfully!';
                    
                    // Insert notification
                    const formParent = e.target.closest('.category-title-edit');
                    formParent.appendChild(notification);
                    
                    // Reset edit state
                    setTimeout(() => {
                        this.cancelSubcategoryEdit();
                        location.reload(); // Refresh to show updated data
                    }, 1500);
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('There was an error updating the subcategory. Please try again.');
                    
                    // Reset button state
                    submitBtn.textContent = originalText;
                    submitBtn.disabled = false;
                });
            }
        }
    });

    // Mount apps to their respective containers
    const staffAppContainer = document.getElementById('staff-management-app');
    if (staffAppContainer) {
        staffApp.mount('#staff-management-app');
    }
    
    const locationsAppContainer = document.getElementById('locations-app');
    if (locationsAppContainer) {
        locationsApp.mount('#locations-app');
    }
    
    const categoriesAppContainer = document.getElementById('task-categories-app');
    if (categoriesAppContainer) {
        categoriesApp.mount('#task-categories-app');
    }
}


<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('applications', function (Blueprint $table) {
            // Primary key
            $table->bigIncrements('application_id')->unsigned(); // Use bigIncrements for auto-increment primary key

            // Foreign keys
            $table->bigInteger('job_id')->unsigned(); // Ensure this matches the type of job_postings.job_id
            $table->bigInteger('pwd_id')->unsigned(); // Ensure this matches the type of users.user_id

            // Columns
            $table->text('cover_letter')->nullable(); // Nullable column
            $table->string('resume', 255); // Not null by default
            $table->timestamp('applied_at')->default(DB::raw('CURRENT_TIMESTAMP')); // Default to current timestamp
            $table->enum('status', ['pending', 'reviewed', 'accepted', 'rejected'])->default('pending'); // Enum with default value

            // Foreign key constraints
            $table->foreign('job_id')->references('job_id')->on('job_postings')->onDelete('cascade'); // Assuming job_id is bigInteger in job_postings
            $table->foreign('pwd_id')->references('users_id')->on('users')->onDelete('cascade'); // Assuming users_id is the primary key in users

            // Timestamps for created_at and updated_at
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('applications');
    }
};

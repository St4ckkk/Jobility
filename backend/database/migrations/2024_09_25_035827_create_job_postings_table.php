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
        Schema::create('job_postings', function (Blueprint $table) {
            $table->bigInteger('job_id')->unsigned()->primary();
            $table->bigInteger('employer_id')->unsigned();
            $table->string('job_title',  255);
            $table->string('job_description',   255);
            $table->decimal('salary',  10, 2);
            $table->string('location', 255);
            $table->enum('employment_type', ['full-time','part-time', 'remote']);
            $table->timestamp('posted_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->date('expiration_date');
            $table->timestamps();
            $table->foreign('employer_id')->references('users_id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('job_postings');
    }
};
